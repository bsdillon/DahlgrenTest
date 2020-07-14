import docx2txt

out = open('output.txt', 'w')
out.write(docx2txt.process("IrisDataStats_kkarp9.docx"))
out.close()