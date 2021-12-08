import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ShipmentComponent } from './shipment/shipment.component';
import {ShipmentsComponent} from './shipments/shipments.component'



const routes: Routes = [
  { path: 'Shipments', component:  ShipmentsComponent},
  { path: 'Shipment', component:  ShipmentComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
