import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-coches-page',
  templateUrl: './coches-page.component.html',
  styleUrl: './coches-page.component.css'
})
export class CochesPageComponent{

  constructor(private route: Router) { }

  crear() {
    this.route.navigate([`admin/vehiculo/form`]);
  }
}
