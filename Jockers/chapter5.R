rm(list = ls())
ls()
text_v <- scan("data/text/melville.txt", what = "character", sep = "\n") 
start_v <- which(text_v == "CHAPTER 1. Loomings.")
novel_lines_v <- text_v[start_v:length(text_v)]
novel_lines_v
?grep
chap_positions_v <- grep("^CHAPTER \\d", novel_lines_v)
novel_lines_v[chap_positions_v]
head(novel_lines_v[chap_positions_v])
tail(novel_lines_v)
chap_positions_v
last_position_v <- length(novel_lines_v)
chap_positions_v <- c(chap_positions_v , last_position_v)
chap_positions_v
chap_positions_v[1]
chap_positions_v[2]
for(i in 1:length(chap_positions_v)){
  print(chap_positions_v[i])
}
chapter_raws_l <- list() 
chapter_freqs_l <- list()
for(i in 1:length(chap_positions_v)){
  if(i != length(chap_positions_v)){
    chapter_title <- novel_lines_v[chap_positions_v[i]]
    start <- chap_positions_v[i] + 1
    end <- chap_positions_v[i + 1] - 1
    chapter_lines_v <- novel_lines_v[start:end]
    chapter_words_v <- tolower(paste(chapter_lines_v, collapse = " ")) 
    chapter_words_l <- strsplit(chapter_words_v, "\\W")
    chapter_word_v <- unlist(chapter_words_l)
    chapter_word_v <- chapter_word_v[which(chapter_word_v != "")] 
    chapter_freqs_t <- table(chapter_word_v) 
    chapter_raws_l[[chapter_title]] <- chapter_freqs_t 
    chapter_freqs_t_rel <- 100*(chapter_freqs_t/sum(chapter_freqs_t)) 
    chapter_freqs_l[[chapter_title]] <- chapter_freqs_t_rel
  } 
}
x<-c(1, 2, 3, 4, 5) 
y<-c(6, 7, 8, 9, 10)
rbind(x, y)
y<-c(6, 7, 8, 9, 10, 11)
rbind(x, y)
x <- list(a = 1:10, b = 2:25, b=100:1090)
x
lapply(x, mean)
chapter_freqs_l[[1]]["whale"]
lapply(chapter_freqs_l, '[', 'whale')
whale_l <- lapply(chapter_freqs_l, '[', 'whale')
x <- list(1:3, 4:6, 7:9) 
x
do.call(rbind, x)
whales_m <- do.call(rbind, whale_l)
head(whales_m)
ahab_l <- lapply(chapter_freqs_l, '[', 'ahab') 
ahabs_m <- do.call(rbind, ahab_l)
head(ahabs_m)
ahabs_m
class(whales_m[,1])
x<-c(1, 2, 3, 4, 5, 6) 
y<-c(2, 4, 5, 6, 7, 8)
z <- c(24, 23, 34, 32, 12, 10) 
test_m <- cbind(x, y, z) 
test_m
test_m[2, 3]
test_m[2,]
whales_v <- whales_m[,1] 
ahabs_v <- ahabs_m[,1]
whales_ahabs_m <- cbind(whales_v, ahabs_v) 
dim(whales_ahabs_m)
colnames(whales_ahabs_m) <- c("whale", "ahab")
barplot(whales_ahabs_m, beside = TRUE)
