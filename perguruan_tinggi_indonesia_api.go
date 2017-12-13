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
        
        //Handler untuk mendapatkan data perguruan tinggi
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

        //Handler untuk mendapatkan data perguruan tinggi dan data rektor
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

        //Handler untuk mendapatkan nama perguruan tinggi dan nama rektor
        http.HandleFunc("/perguruan_tinggi_rektor_nama/", func(w http.ResponseWriter, r *http.Request) {
                switch r.Method {
                        case "GET":
                                s:=r.URL.Query().Get("provinsi")
                                if (s!="") {
                                        GetPerguruanTinggiNameAndRektorNameByProvinsi(w, r, s)
                                } else {
                                        GetAllPerguruanTinggiNameAndRektorName(w, r) 
                                }

                        default:
                                http.Error(w,"invalid",405)
                }
        })

        log.Printf("Server starting on port %v", port)
        log.Fatal(http.ListenAndServe(fmt.Sprintf(":%v", port), nil))
}

//Fungsi GetAllPerguruanTinggi akan mengembalikan data seluruh perguruan tinggi di Indonesia
//Data perguruan tinggi yang dikembalikan berupa Id_perguruan_tinggi, Nama_perguruan_tinggi, Alamat, Provinsi, dan No_telepon
func GetAllPerguruanTinggi(w http.ResponseWriter, r *http.Request) {
        db, err := sql.Open("mysql",
                "root:@tcp(167.205.67.251:3306)/perguruan_tinggi_indonesia")

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

//Fungsi GetPerguruanTinggiByProvinsi akan mengembalikan data perguruan tinggi di Indonesia yang terletak di provinsi tertentu
//Data perguruan tinggi yang dikembalikan berupa Id_perguruan_tinggi, Nama_perguruan_tinggi, Alamat, dan No_telepon
func GetPerguruanTinggiByProvinsi(w http.ResponseWriter, r *http.Request, provinsi string) {
        db, err := sql.Open("mysql",
                "root:@tcp(167.205.67.251:3306)/perguruan_tinggi_indonesia")

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

//Fungsi GetAllPerguruanTinggiNameAndRektorName akan mengembalikan nama perguruan tinggi di seluruh Indonesia beserta nama rektor dari setiap perguruan tinggi
func GetAllPerguruanTinggiNameAndRektorName(w http.ResponseWriter, r *http.Request) {
        db, err := sql.Open("mysql",
                "root:@tcp(167.205.67.251:3306)/perguruan_tinggi_indonesia")

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

//Fungsi GetPerguruanTinggiNameAndRektorNameByProvinsi akan mengembalikan nama perguruan tinggi yang terletak di provinsi tertentu beserta nama rektor dari perguruan tinggi tersebut
func GetPerguruanTinggiNameAndRektorNameByProvinsi(w http.ResponseWriter, r *http.Request, provinsi string) {
        db, err := sql.Open("mysql",
                "root:@tcp(167.205.67.251:3306)/perguruan_tinggi_indonesia")

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

//Fungsi GetAllPerguruanTinggiAndRektor akan mengembalikan data perguruan tinggi di seluruh Indonesia beserta data rektor dari setiap perguruan tinggi
//Data perguruan tinggi yang dikembalikan berupa Id_perguruan_tinggi, Nama_perguruan_tinggi, Alamat, dan No_telepon
//Data rektor yang dikembalikan berupa Id_rektor, Nama_rektor, dan Email.
func GetAllPerguruanTinggiAndRektor(w http.ResponseWriter, r *http.Request) {
        db, err := sql.Open("mysql",
                "root:@tcp(167.205.67.251:3306)/perguruan_tinggi_indonesia")

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

//Fungsi GetPerguruanTinggiAndRektorByProvinsi akan mengembalikan data perguruan tinggi yang terletak di provinsi tertentu beserta data rektor dari perguruan tinggi tersebut
//Data perguruan tinggi yang dikembalikan berupa Id_perguruan_tinggi, Nama_perguruan_tinggi, Alamat, dan No_telepon
//Data rektor yang dikembalikan berupa Id_rektor, Nama_rektor, dan Email.
func GetPerguruanTinggiAndRektorByProvinsi(w http.ResponseWriter, r *http.Request, provinsi string) {
        db, err := sql.Open("mysql",
                "root:@tcp(167.205.67.251:3306)/perguruan_tinggi_indonesia")

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