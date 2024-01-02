Web Scraper using Python
========================

This Python program demonstrates a basic web scraper using `requests`, `BeautifulSoup`, and `tkinter`. It allows users to input a URL, scrape the links from the webpage content, and display them using regular expressions and BeautifulSoup.

Prerequisites
-------------
- Python 3.x
- Required Python packages: `requests`, `BeautifulSoup`, `tkinter`

Usage
-----
1. Run the Python script `web_scraper.py`.
2. Enter the URL of the webpage you want to scrape in the provided entry field.
3. Click the "Scrape" button to start the scraping process.
4. The results will be displayed in the text widget below the URL entry.

Important Notes
---------------
- This scraper collects links from the provided URL's HTML content using regular expressions and BeautifulSoup.
- Ensure you have a stable internet connection for successful URL access and scraping.
- The program anonymizes requests through Tor if enabled in the `AnonBrowser` class.

Files Included
--------------
- `web_scraper.py`: Python script containing the web scraping functionality.
- `readme.txt`: This file, providing instructions and information about the project.

Disclaimer
----------
- Use this web scraper responsibly and ensure compliance with website terms of service and legal guidelines.
- Respect website policies regarding scraping and data collection to avoid any legal issues.

