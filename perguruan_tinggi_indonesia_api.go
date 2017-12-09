package main

import (
        "database/sql"
        "encoding/json"
        "fmt"
        "log"
        "net/http"

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
        Id_perguruan_tinggi     int
        Nama_perguruan_tinggi   string
        Alamat                  string
        No_telepon              string
}

type perguruanTinggiRektor struct{
        Nama_perguruan_tinggi   string
        Nama_rektor             string
}

type perguruanTinggiAndRektor struct{
        Id_perguruan_tinggi     int
        Nama_perguruan_tinggi   string
        Alamat                  string
        No_telepon              string
        Id_rektor       int
        Nama_rektor     string
        Email           string
}

func main() {
        port:=8181
        http.HandleFunc("/perguruan_tinggi/", func(w http.ResponseWriter, r *http.Request) {
                switch r.Method {
                        case "GET":
                                s:=r.URL.Query().Get("provinsi")
                                if (s!="") {
                                        GetPerguruanTinggiByProvinsi(w, r, s)
                                } else {
                                        GetAllPerguruanTinggi(w, r) 
                                }

                        default:
                                http.Error(w,"invalid",405)
                }
        })

        http.HandleFunc("/perguruan_tinggi_rektor/", func(w http.ResponseWriter, r *http.Request) {
                switch r.Method {
                        case "GET":
                                s:=r.URL.Query().Get("provinsi")
                                if (s!="") {
                                        GetPerguruanTinggiAndRektorByProvinsi(w, r, s)
                                } else {
                                        GetAllPerguruanTinggiAndRektor(w, r) 
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

        perguruan_tinggi := perguruanTinggiDiIndonesia{}

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

        perguruan_tinggi := perguruanTinggiIndonesia{}

        rows, err:=db.Query("select Id_perguruan_tinggi, Nama_perguruan_tinggi, Alamat, No_telepon from perguruan_tinggi where Provinsi like?", provinsi)
        if err != nil {
                log.Fatal(err)
        }

        defer rows.Close()
        for rows.Next() {
                err:= rows.Scan(&perguruan_tinggi.Id_perguruan_tinggi, &perguruan_tinggi.Nama_perguruan_tinggi, &perguruan_tinggi.Alamat, &perguruan_tinggi.No_telepon)
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

//GetAllPerguruanTinggiNameAndRektorName
func GetAllPerguruanTinggiNameAndRektorName(w http.ResponseWriter, r *http.Request) {
        db, err := sql.Open("mysql",
                "root:@tcp(127.0.0.1:3306)/perguruan_tinggi_indonesia")

        if err != nil {
                log.Fatal(err)
        }
        defer db.Close()

        perguruan_tinggi := perguruanTinggiRektor{}

        rows, err:=db.Query("select Nama_perguruan_tinggi, Nama_rektor from perguruan_tinggi natural join rektor")
        if err != nil {
                log.Fatal(err)
        }

        defer rows.Close()
        for rows.Next() {
                err:= rows.Scan(&perguruan_tinggi.Nama_perguruan_tinggi, &perguruan_tinggi.Nama_rektor)
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

//GetPerguruanTinggiNameAndRektorNameByProvinsi
func GetPerguruanTinggiNameAndRektorNameByProvinsi(w http.ResponseWriter, r *http.Request, provinsi string) {
        db, err := sql.Open("mysql",
                "root:@tcp(127.0.0.1:3306)/perguruan_tinggi_indonesia")

        if err != nil {
                log.Fatal(err)
        }
        defer db.Close()

        perguruan_tinggi := perguruanTinggiRektor{}

        rows, err:=db.Query("select Nama_perguruan_tinggi, Nama_rektor from perguruan_tinggi natural join rektor where Provinsi like?", provinsi)
        if err != nil {
                log.Fatal(err)
        }

        defer rows.Close()
        for rows.Next() {
                err:= rows.Scan(&perguruan_tinggi.Nama_perguruan_tinggi, &perguruan_tinggi.Nama_rektor)
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

//GetAllPerguruanTinggiAndRektorByProvinsi
func GetAllPerguruanTinggiAndRektor(w http.ResponseWriter, r *http.Request) {
        db, err := sql.Open("mysql",
                "root:@tcp(127.0.0.1:3306)/perguruan_tinggi_indonesia")

        if err != nil {
                log.Fatal(err)
        }
        defer db.Close()

        perguruan_tinggi := perguruanTinggiAndRektor{}

        rows, err:=db.Query("select Id_perguruan_tinggi, Nama_perguruan_tinggi, Alamat, No_telepon, Id_rektor, Nama_rektor, Email from perguruan_tinggi natural join rektor")
        if err != nil {
                log.Fatal(err)
        }

        defer rows.Close()
        for rows.Next() {
                err:= rows.Scan(&perguruan_tinggi.Id_perguruan_tinggi, &perguruan_tinggi.Nama_perguruan_tinggi, &perguruan_tinggi.Alamat, &perguruan_tinggi.No_telepon, &perguruan_tinggi.Id_rektor, &perguruan_tinggi.Nama_rektor, &perguruan_tinggi.Email)
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

//GetPerguruanTinggiAndRektorByProvinsi
func GetPerguruanTinggiAndRektorByProvinsi(w http.ResponseWriter, r *http.Request, provinsi string) {
        db, err := sql.Open("mysql",
                "root:@tcp(127.0.0.1:3306)/perguruan_tinggi_indonesia")

        if err != nil {
                log.Fatal(err)
        }
        defer db.Close()

        perguruan_tinggi := perguruanTinggiAndRektor{}

        rows, err:=db.Query("select Id_perguruan_tinggi, Nama_perguruan_tinggi, Alamat, No_telepon, Id_rektor, Nama_rektor, Email from perguruan_tinggi natural join rektor where Provinsi like?", provinsi)
        if err != nil {
                log.Fatal(err)
        }

        defer rows.Close()
        for rows.Next() {
                err:= rows.Scan(&perguruan_tinggi.Id_perguruan_tinggi, &perguruan_tinggi.Nama_perguruan_tinggi, &perguruan_tinggi.Alamat, &perguruan_tinggi.No_telepon, &perguruan_tinggi.Id_rektor, &perguruan_tinggi.Nama_rektor, &perguruan_tinggi.Email)
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