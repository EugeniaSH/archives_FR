### Creating a text corpus for French Revolution archives ###
library(tm)
tome8.dir <- "../archives_fr/Tome_8"
tome8.orig <- Corpus(DirSource(tome8.dir,encoding="UTF-8",pattern=glob2rx("*.txt")),
                     readerControl=list(language="fr"))
tome8 <- tome8.orig

tome8 <- tm_map(tome8, removePunctuation)
tome8 <- tm_map(tome8, stripWhitespace)
tome8 <- tm_map(tome8, tolower)

tome8 <- tm_map(tome8, removeWords, stopwords("french"))

dtm <- DocumentTermMatrix(tome8)

tdm <- TermDocumentMatrix(tome8)
## Finding associated words ##
findAssocs(tdm, c("crédit", "pamphlets"), c(0.2, 0.2))
