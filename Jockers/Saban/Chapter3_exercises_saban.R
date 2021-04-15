library("stringr")

url <- "https://raw.githubusercontent.com/OpenITI/0325AH/master/data/0310Tabari/0310Tabari.Tarikh/0310Tabari.Tarikh.Shamela0009783BK1-ara1.completed"
text_v <- scan(url, what="character", sep="\n", encoding="UTF-8")
splitter_index <- which(text_v == "#META#Header#End#")
lines_v <- text_v[(splitter_index+1):length(text_v)]
book_v <- paste(lines_v, collapse = "\n")
book_word_l <- str_split(book_v, "\\W+")
book_word_v <- unlist(book_word_l)
book_freqs_t <- table(book_word_v)
sorted_book_freqs_t <- sort(book_freqs_t, decreasing = TRUE)
sorted_book_freqs_t[1:5]
sorted_book_freqs_t[1:10]
sorted_book_freqs_t["الخليفة"]
all_tokens <- length(book_word_v)
all_tokens
all_tokens_freqs <- sum(sorted_book_freqs_t)
all_tokens_freqs
all_tokens_freqs == all_tokens
all_token_freqs <- sum(sorted_book_freqs_t)
rel_freq <- sorted_book_freqs_t[1] / all_token_freqs
rel_freq
rel_freq["الخليفة"]
sorted_book_freqs_t["الخليفة"] / all_token_freqs
