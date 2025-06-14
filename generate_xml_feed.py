"""
Script to generate XML feed based on index.html.
Ensure that you have generated the latest index.html from index.org before running.

python generate_xml_feed.py
"""
import xml.etree.ElementTree as ET
from datetime import datetime
import re
from bs4 import BeautifulSoup
import os
import urllib.request

def extract_date_from_filename(filename):
    """
    Extract date from filename pattern like '25-05-08-hard-lines.jpg'

    Args:
        filename (str): The filename to extract date from

    Returns:
        datetime or None: Parsed date or None if not found
    """
    # Match pattern: YY-MM-DD at start of filename
    match = re.match(r'(\d{2})-(\d{2})-(\d{2})', filename)
    if match:
        year, month, day = match.groups()
        try:
            # Assume 20XX for years
            full_year = 2000 + int(year)
            return datetime(full_year, int(month), int(day))
        except ValueError:
            return None
    return None

def get_image_info(img_path, base_url):
    """
    Get image URL, size, and MIME type for enclosure

    Args:
        img_path (str): Image path from HTML
        base_url (str): Base URL for the site

    Returns:
        tuple: (url, length, mime_type)
    """
    # Convert to absolute URL
    if img_path.startswith('./'):
        img_url = f"{base_url.rstrip('/')}/{img_path[2:]}"
    elif not img_path.startswith('http'):
        img_url = f"{base_url.rstrip('/')}/{img_path.lstrip('/')}"
    else:
        img_url = img_path

    # Determine MIME type from extension
    ext = os.path.splitext(img_path)[1].lower()
    mime_types = {
        '.jpg': 'image/jpeg',
        '.jpeg': 'image/jpeg',
        '.png': 'image/png',
        '.gif': 'image/gif',
        '.webp': 'image/webp'
    }
    mime_type = mime_types.get(ext, 'image/jpeg')

    # Try to get file size
    length = "0"
    try:
        # Try local file first
        local_path = img_path.lstrip('./')
        if os.path.exists(local_path):
            length = str(os.path.getsize(local_path))
        else:
            # Try to get remote file size
            with urllib.request.urlopen(img_url) as response:
                length = response.headers.get('Content-Length', '0')
    except:
        length = "0"

    return img_url, length, mime_type

def generate_rss_feed(html_file, blog_title, blog_url, blog_description):
    # Parse the HTML file
    with open(html_file, 'r', encoding='utf-8') as f:
        html_content = f.read()

    soup = BeautifulSoup(html_content, 'html.parser')

    # Find all coffee entries in c-img divs
    coffee_entries = soup.find_all('div', class_='c-img')

    # Create RSS feed
    rss = ET.Element('rss', version='2.0')
    channel = ET.SubElement(rss, 'channel')

    # Add channel information
    title_elem = ET.SubElement(channel, 'title')
    title_elem.text = blog_title

    link_elem = ET.SubElement(channel, 'link')
    link_elem.text = blog_url

    desc_elem = ET.SubElement(channel, 'description')
    desc_elem.text = blog_description

    # Add current date as lastBuildDate
    build_date = ET.SubElement(channel, 'lastBuildDate')
    build_date.text = datetime.now().strftime('%a, %d %b %Y %H:%M:%S +0000')

    # Add items (coffee entries)
    for entry in coffee_entries:
        item = ET.SubElement(channel, 'item')

        # Extract image
        img_elem = entry.find('img')
        img_src = img_elem['src'] if img_elem and img_elem.has_attr('src') else None

        # Extract caption
        caption_elem = entry.find('div', class_='caption')
        caption_text = caption_elem.get_text().strip() if caption_elem else ""

        # Generate title from image filename
        if img_src:
            filename = os.path.basename(img_src)
            # Remove extension and convert to readable title
            title_base = os.path.splitext(filename)[0]
            # Replace hyphens with spaces and capitalize
            post_title = title_base.replace('-', ' ').title()
        else:
            post_title = "Coffee Entry"

        item_title = ET.SubElement(item, 'title')
        item_title.text = post_title

        # Create link (use blog URL with anchor based on filename)
        if img_src:
            filename = os.path.basename(img_src)
            anchor = os.path.splitext(filename)[0]
            link = f"{blog_url.rstrip('/')}#{anchor}"
        else:
            link = blog_url

        item_link = ET.SubElement(item, 'link')
        item_link.text = link

        item_guid = ET.SubElement(item, 'guid')
        item_guid.text = link

        # Extract date from filename
        if img_src:
            filename = os.path.basename(img_src)
            post_date = extract_date_from_filename(filename)
            if post_date:
                pub_date = ET.SubElement(item, 'pubDate')
                pub_date.text = post_date.strftime('%a, %d %b %Y %H:%M:%S +0000')
            else:
                pub_date = ET.SubElement(item, 'pubDate')
                pub_date.text = datetime.now().strftime('%a, %d %b %Y %H:%M:%S +0000')
        else:
            pub_date = ET.SubElement(item, 'pubDate')
            pub_date.text = datetime.now().strftime('%a, %d %b %Y %H:%M:%S +0000')

        # Add description (caption only)
        description = ET.SubElement(item, 'description')
        description.text = caption_text if caption_text else post_title

        # Add image as enclosure
        if img_src:
            img_url, length, mime_type = get_image_info(img_src, blog_url)
            enclosure = ET.SubElement(item, 'enclosure')
            enclosure.set('url', img_url)
            enclosure.set('length', length)
            enclosure.set('type', mime_type)

    # Create XML tree and write to file
    tree = ET.ElementTree(rss)

    # Format the XML with indentation
    from xml.dom import minidom
    xml_str = ET.tostring(rss, 'utf-8')
    reparsed = minidom.parseString(xml_str)
    pretty_xml = reparsed.toprettyxml(indent="  ")

    # Write to file
    with open('feed.xml', 'w', encoding='utf-8') as f:
        f.write(pretty_xml)

    return 'feed.xml'

if __name__ == "__main__":
    html_file = "index.html"
    blog_title = "Coffee Log"
    blog_url = "https://coffee.example.com"  # Update with actual URL
    blog_description = "A personal coffee tasting log with notes and images."

    if os.path.exists(html_file):
        output_file = generate_rss_feed(html_file, blog_title, blog_url, blog_description)
        print(f"RSS feed generated successfully: {output_file}")
    else:
        print(f"Error: {html_file} not found")

