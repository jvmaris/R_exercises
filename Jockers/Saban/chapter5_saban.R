setwd("/Users/saban/Documents/TextAnalysisWithR")
text.v <- scan("data/plainText/melville.txt", what="character", sep="\n")
start.v <- which(text.v == "CHAPTER 1. Loomings.")
end.v <- which(text.v == "orphan.")
novel.lines.v <- text.v[start.v:end.v]
novel.lines.v <- unlist(novel.lines.v)
chap.positions.v <- grep("^CHAPTER \\d", novel.lines.v)
last.position.v <- length(novel.lines.v)
chap.positions.v <- c(chap.positions.v , last.position.v)
chapter.freqs.l <- list()
chapter.raws.l <- list()
for(i in 1:length(chap.positions.v)){
  if(i != length(chap.positions.v)){
    chapter.title <- novel.lines.v[chap.positions.v[i]]
    start <- chap.positions.v[i]+1
    end <- chap.positions.v[i+1]-1
    chapter.lines.v <- novel.lines.v[start:end]
    chapter.words.v <- tolower(paste(chapter.lines.v, collapse=" "))
    chapter.words.l <- strsplit(chapter.words.v, "\\W")
    chapter.word.v <- unlist(chapter.words.l)
    chapter.word.v <- chapter.word.v[which(chapter.word.v!="")]
    chapter.freqs.t <- table(chapter.word.v)
    chapter.raws.l[[chapter.title]] <- chapter.freqs.t
    chapter.freqs.t.rel <- 100*(chapter.freqs.t/sum(chapter.freqs.t))
    chapter.freqs.l[[chapter.title]] <- chapter.freqs.t.rel
  }
}
whale.l <- lapply(chapter.freqs.l, '[', 'whale')
whales.m <- do.call(rbind, whale.l)
ahab.l <- lapply(chapter.freqs.l, '[', 'ahab')
ahabs.m <- do.call(rbind, ahab.l)
whales.v <- as.vector(whales.m[,1])
ahabs.v <- as.vector(ahabs.m[,1])
whales.ahabs.m <- cbind(whales.v, ahabs.v)
colnames(whales.ahabs.m) <- c("whale", "ahab")

my.l <- lapply(chapter.freqs.l, "[", "my")
my.m <- do.call(rbind, my.l)
my.v <- as.vector(my.m[,1])
i.l <- lapply(chapter.freqs.l, "[", "i")
i.m <- do.call(rbind, i.l)
i.v <- as.vector(i.m[,1])
whales.ahabs.my.i.m <- cbind(whales.v, ahabs.v, my.v, i.v)
whales.ahabs.my.i.m[which(is.na(whales.ahabs.my.i.m))] <- 0
cor(whales.ahabs.my.i.m)

my.i.m <- cbind(my.v, i.v)
my.i.m[which(is.na(my.i.m))] <- 0
my.i.cor.data.df <- as.data.frame(my.i.m)
cor(my.i.cor.data.df$i, my.i.cor.data.df$my)
i.my.cors.v <- NULL
for(i in 1:10000){
  i.my.cors.v <- c(i.my.cors.v,
                   cor(sample(my.i.cor.data.df$i), my.i.cor.data.df$my))
}
