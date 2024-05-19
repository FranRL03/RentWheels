import { Component } from '@angular/core';

@Component({
  selector: 'app-lista-alquileres',
  templateUrl: './lista-alquileres.component.html',
  styleUrl: './lista-alquileres.component.css'
})
export class ListaAlquileresComponent {
  active = 1;
  statusRentFalse = false;
  statusRentTrue = true;
}
