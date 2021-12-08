import { Component, OnInit } from '@angular/core';
import { ShipmentServiceService } from '../shipment-service.service';

@Component({
  selector: 'app-shipment',
  templateUrl: './shipment.component.html',
  styleUrls: ['./shipment.component.css']
})
export class ShipmentComponent implements OnInit {
  SenderName:any;
  Description:any;
  RecipientAddress:any;
  Expedited:any;
  ShipmentType:any;
  data:any;
  constructor(private _ShipmentServiceService:ShipmentServiceService) { }
  CreateShipment(){
    if(this.SenderName === null || this.SenderName === undefined){
      alert("Please Enter Sender Name");
      return;
    }
    if(this.Description === null || this.Description === undefined){
      alert("Please Enter Description");
      return;
    }
    if(this.RecipientAddress === null || this.RecipientAddress === undefined){
      alert("Please Enter Recipient Address");
      return;
    }
    if(this.ShipmentType === null || this.ShipmentType === undefined){
      alert("Please Select Shipment Type");
      return;
    }
    this.data={
      SenderName:this.SenderName,
      Description:this.Description,
      RecipientAddress:this.RecipientAddress,
      Expedited:this.Expedited,
      ShipmentType:this.ShipmentType
    }
    this._ShipmentServiceService.createShipment(this.data).subscribe(data => {
      window.location.href = window.location.href;
    });
  }
  ngOnInit(): void {
  }

}
