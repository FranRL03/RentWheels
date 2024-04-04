import { Component, inject } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-modelo-con-vehiculos',
  templateUrl: './modelo-con-vehiculos.component.html',
  styleUrl: './modelo-con-vehiculos.component.css'
})
export class ModeloConVehiculosComponent {

  route: ActivatedRoute = inject(ActivatedRoute);
  idModelo!: string;

  constructor( private router: Router) {
    this.idModelo = this.route.snapshot.params['idModelo'];
  }

}
