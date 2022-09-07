import glob
import pandas as pd

from acdh_tei_pyutils.tei import TeiReader

files = glob.glob('./editions/*-an-*.xml')
unbekannt = "unbekannt"

for x in sorted(files):
    item = {
        "sender": unbekannt,
        "sender_ref": unbekannt,
        "sender_place": unbekannt,
        "sender_place_ref": unbekannt,
        "receiver_name": unbekannt,
    }
    doc = TeiReader(x)
    item['title'] = doc.any_xpath('.//tei:title[@type="label"]')[0].text
    try:
        item['date'] = doc.any_xpath('.//@when-iso')[0]
    except:
        item['date'] = None
    try:
        item['sender_ref'] = doc.any_xpath('.//tei:rs[@type="person"]/@ref')[0]
    except:
        pass
    try:
        item['sender'] = doc.any_xpath('.//tei:rs[@type="person"]/text()')[0]
    except:
        pass


    item['sender'] = " ".join(item['sender'].split())