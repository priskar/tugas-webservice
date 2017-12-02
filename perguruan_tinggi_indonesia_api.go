package main

import (
        "database/sql"
        "encoding/json"
        "fmt"
        "log"
        "net/http"
        "strconv"

        _ "github.com/go-sql-driver/mysql"
)

type perguruanTinggiDiIndonesia struct{
        Id_perguruan_tinggi     int
        Nama_perguruan_tinggi   string
        Alamat                  string
        Provinsi                string
        No_telepon              string
}

type perguruanTinggiIndonesia struct{
        Nama_perguruan_tinggi   string
        Alamat                  string
        No_telepon              string
}

type perguruanTinggi struct{
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
                                s:=r.URL.Query().Get("id")
                                if s!=""{
                                        GetPerguruanTinggiByProvinsi(w, r, s)
                                } else {
                                        GetAllPerguruanTinggi(w, r)
                                }

                        default:
                                http.Error(w,"invalid",405)
                }
        })

        http.HandleFunc("/rektor/", func(w http.ResponseWriter, r *http.Request) {
                switch r.Method {
                        case "GET":
                                s:=r.URL.Path[len("/rektor/"):]
                                if s==""{
                                        GetAllRektor(w, r)
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

//GetPerguruanTinggiByProvinsi
func GetPerguruanTinggiByProvinsi(w http.ResponseWriter, r *http.Request, provinsi string) {
        db, err := sql.Open("mysql",
                "root:@tcp(127.0.0.1:3306)/perguruan_tinggi_indonesia")

        if err != nil {
                log.Fatal(err)
        }
        defer db.Close()

        perguruan_tinggi := perguruanTinggi{}

        rows, err:=db.Query("select Id_perguruan_tinggi, Nama_perguruan_tinggi, Alamat, Provinsi, No_telepon from perguruan_tinggi where Provinsi like?", provinsi)
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

//GetAllRektor
func GetAllRektor(w http.ResponseWriter, r *http.Request) {
        db, err := sql.Open("mysql",
                "root:@tcp(127.0.0.1:3306)/perguruan_tinggi_indonesia")

        if err != nil {
                log.Fatal(err)
        }
        defer db.Close()

        rektor := rektor{}

        rows, err:=db.Query("select Id_rektor, Nama_rektor, Email from rektor")
        if err != nil {
                log.Fatal(err)
        }

        defer rows.Close()
        for rows.Next() {
                err:= rows.Scan(&rektor.Id_rektor, &rektor.Nama_rektor, &rektor.Email)
                if err != nil{
                        log.Fatal(err)
                }
                json.NewEncoder(w).Encode(&rektor)
        }
        err=rows.Err()
        if err != nil {
                log.Fatal(err)
        }
}