package main

import (
        "database/sql"
        "encoding/json"
        "fmt"
        "log"
        "net/http"

        _ "github.com/go-sql-driver/mysql"
)

type perguruanTinggi struct{
        Id_perguruan_tinggi     int
        Nama_perguruan_tinggi   string
        Alamat                  string
        Provinsi                string
        No_telepon              string
}

type rektor struct{
        Id_rektor       int
        Nama_rektor     string
        Email           string
}

func main() {
        port:=8181

        http.HandleFunc("/perguruan_tinggi/", func(w http.ResponseWriter, r *http.Request) {

                switch r.Method {
                case "GET":
                        s:=r.URL.Path[len("/perguruan_tinggi/"):]
                        if s==""{
                                GetAllPerguruanTinggi(w, r)
                        }

                default:
                        http.Error(w,"invalid",405)
                }
        })
        log.Printf("Server starting on port %v", port)
        log.Fatal(http.ListenAndServe(fmt.Sprintf(":%v", port), nil))
}

//GetAllPerguruanTinggi
func GetAllPerguruanTinggi(w http.ResponseWriter, r *http.Request) {
        db, err := sql.Open("mysql",
                "root:@tcp(127.0.0.1:3306)/perguruan_tinggi_indonesia")

        if err != nil {
                log.Fatal(err)
        }
        defer db.Close()

        perguruan_tinggi := perguruanTinggi{}

        rows, err:=db.Query("select Id_perguruan_tinggi, Nama_perguruan_tinggi, Alamat, Provinsi, No_telepon from perguruan_tinggi")
        if err != nil {
                log.Fatal(err)
        }

        defer rows.Close()
        for rows.Next() {
                err:= rows.Scan(&perguruan_tinggi.Id_perguruan_tinggi, &perguruan_tinggi.Nama_perguruan_tinggi, &perguruan_tinggi.Alamat, &perguruan_tinggi.Provinsi, &perguruan_tinggi.No_telepon)
                if err != nil{
                        log.Fatal(err)
                }
                json.NewEncoder(w).Encode(&perguruan_tinggi)
        }
        err=rows.Err()
        if err != nil {
                log.Fatal(err)
        }
}