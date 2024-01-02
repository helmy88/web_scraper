#!/usr/bin/env python

import requests
from bs4 import BeautifulSoup
import tkinter as tk
from tkinter import ttk
import re

class AnonBrowser:
    def __init__(self):
        self.session = requests.Session()
        self.session.proxies = {}
        self.session.verify = False

    def open(self, url):
        return self.session.get(url)

    def anonymize(self, tor=False):
        if tor:
            self.session.proxies = {'http': 'http://127.0.0.1:8118',
                                     'https': 'https://127.0.0.1:8118'}

def print_links(url, text_widget):
    try:
        ab = AnonBrowser()
        ab.anonymize()
        page = ab.open(url)
        html = page.text

        text_widget.insert(tk.END, '[+] Printing Links From Regex.\n')
        link_finder = re.compile(r'href="(.*?)"')
        links = link_finder.findall(html)

        for link in links:
            text_widget.insert(tk.END, link + '\n')
        
        text_widget.insert(tk.END, '\n[+] Printing Links From BeautifulSoup.\n')
        soup = BeautifulSoup(html, 'html.parser')
        links = soup.find_all('a', href=True)

        for link in links:
            text_widget.insert(tk.END, link['href'] + '\n')
    except requests.exceptions.RequestException as e:
        text_widget.insert(tk.END, 'Error: ' + str(e) + '\n')

def scrape_button_clicked():
    url = url_entry.get()
    result_text.delete('1.0', tk.END)  # Clear previous results
    print_links(url, result_text)

# Create the main GUI window
root = tk.Tk()
root.title("Web Scraper")

# Create and configure a label and entry for the URL
url_label = tk.Label(root, text="Enter URL:")
url_label.pack()
url_entry = tk.Entry(root, width=50)
url_entry.pack()

# Create a button to trigger the scraping
scrape_button = tk.Button(root, text="Scrape", command=scrape_button_clicked)
scrape_button.pack()

# Create a text widget to display the results
result_text = tk.Text(root, height=20, width=80)
result_text.pack()

root.mainloop()
