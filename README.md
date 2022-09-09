# thun-data

XML/TEI encoded transcriptions of the correspondence of Leo Thun Hohenstein. 

## process

after adding or changing a file, run the process.xsl 

* adds `when-iso` if `@when` is castable as iso-date

## cmi

To create a CMIF file, run `python make_cmif.py` (make sure you have the needed packages installed, see `requirements.txt`)