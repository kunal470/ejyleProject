import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import {ShipmentModel} from '../shipment-model';
import {ShipmentServiceService} from '../shipment-service.service';

@Component({
  selector: 'app-shipments',
  templateUrl: './shipments.component.html',
  styleUrls: ['./shipments.component.css']
})
export class ShipmentsComponent implements OnInit {
  allShipment: any;
  constructor(private _ShipmentServiceService:ShipmentServiceService) { 
    this.loadShipments();
  }
  loadShipments(){
    this._ShipmentServiceService.getAllShipment().subscribe(data => {
      this.allShipment = data;
    });
  }
  Delete(id:any){
    console.log(id);
    this._ShipmentServiceService.deleteShipment(id).subscribe(X=>{
    this.loadShipments();
    window.location.href = window.location.href;
    });
  }
  ngOnInit(): void {
  }

}
