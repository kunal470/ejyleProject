import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { ShipmentModel } from './shipment-model';

@Injectable({
  providedIn: 'root'
})
export class ShipmentServiceService {

  
  url = 'https://192.168.0.101:45455/api/Shipment';

  constructor(private http: HttpClient) { }

  getAllShipment(): Observable<ShipmentModel[]> {
    return this.http.get<ShipmentModel[]>(this.url);
  }

  getShipmentById(ID: any): Observable<ShipmentModel> {
    return this.http.get<ShipmentModel>(this.url + '/' + ID);
  }

  createShipment(Shipment: ShipmentModel): Observable<ShipmentModel> {
    const httpOptions = { headers: new HttpHeaders({ 'Content-Type': 'application/json' }) };
    return this.http.post<ShipmentModel>(this.url,
      Shipment, httpOptions);
  }

  

  deleteShipment(ID: string): Observable<number> {
    const httpOptions = { headers: new HttpHeaders({ 'Content-Type': 'application/json' }) };
    return this.http.delete<number>(this.url + '/' + ID,
      httpOptions);
  }

  

}
