package main

import (
    "net/http"
    "log"
    "github.com/gorilla/mux"
    "fmt"
)

func YourHandler(w http.ResponseWriter, r *http.Request) {
    w.Write([]byte("Gorilla!\n"))
}

func FuckHandler(w http.ResponseWriter, r *http.Request) {
    w.Write([]byte("fuck you man"))
}

func ArticlesCategoryHandler(w http.ResponseWriter, r *http.Request) {
    vars := mux.Vars(r)
    w.WriteHeader(http.StatusOK)
    fmt.Fprintf(w, "Category: %v\n", vars["category"])
}

func main() {
    r := mux.NewRouter()
    r.HandleFunc("/articles/{category}/", ArticlesCategoryHandler)
    r.HandleFunc("/", YourHandler)
    r.HandleFunc("/fuckyou", FuckHandler)
    log.Fatal(http.ListenAndServe(":8000", r))
}
