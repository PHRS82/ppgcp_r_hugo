library(pdftools)
library(stringr)

UFPB <- read_pdf('http://www.ccj.ufpb.br/pos/contents-2/pdf/edital-de-retificacao-09.pdf', ocr = T)

str_replace_all(string = UFPB, pattern = "/", replacement = "-")

( datas <- str_extract_all(UFPB$all_text, "\\d{2}-\\d{2}-\\d{4}") )



# Professor, não consegui entender direito como usar essa expressão regular para
# extrair as datas