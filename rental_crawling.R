library(rvest)
## Avis租車
url="http://www.avis-taiwan.com/tw/Rental_Office/"
content = read_html(url) %>% html_nodes('.bodyParagraph') %>% html_text()
content <- strsplit(content, '\r\n')
content <- content[[1]][-(1:6)]
head.ind <- grep('地址', content) - 1
head.ind <- setdiff(head.ind, grep('嘟嘟房', content))
head.ind <- setdiff(head.ind, grep('全國加油', content))
head.ind <- setdiff(head.ind, grep('台南機場', content))

df <- NULL
for(i in head.ind){
  df <- rbind(df, c(strsplit(content[i], '地圖')[[1]][1], 
                    strsplit(content[i+1], ':')[[1]][2],
                    strsplit(content[i+2], ':')[[1]][2],
                    strsplit(content[i+3], ' : ')[[1]][2]))
}
colnames(df)<- c('名稱', '地址', '電話','營業時間')
write.csv(df, 'avis.csv', row.names=F)

## 中租
url="https://www.rentalcar.com.tw/TC/Location/Shortterm?ID=tls"
content = read_html(url) %>% html_nodes('.openNum , .faxNum , .addInfo , .CnameInfo') %>% html_text()

df <- NULL
for(i in 1:(length(content)/4)){
  ind <- 1+4*(i-1)
  df <- rbind(df, content[ind:(ind+3)])
}
colnames(df)<- c('名稱', '地址', '電話','營業時間')
write.csv(df, 'rentalcar.csv', row.names=F)