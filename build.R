srcs <- list.files("src", pattern = "\\.Rmd$", full.names = TRUE)
for (src in srcs) {
    out <- gsub("^src/(.*)\\.Rmd", "docs/\\1.md", src)
    knitr::knit(src, out)
}
