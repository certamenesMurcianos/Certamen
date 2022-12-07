import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class DataService {

  private articulos:any
  private urlBase:string = "https://my-json-server.typicode.com/certamenesMurcianos/Certamen/db"
  
  
  private name:string = ""
  private categoria:string = "0"
  private fabricante:string = "0"

  constructor(private http:HttpClient) {
    this.http.get(this.urlBase + "articulos").subscribe(
      (response:any) => {
        this.articulos = response
      }
    )
  }
}
