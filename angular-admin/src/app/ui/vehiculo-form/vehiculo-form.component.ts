import { Component } from '@angular/core';
import { VehiculoService } from '../../services/vehiculo.service';
import { Router } from '@angular/router';
import { VehiculoAllDetails } from '../../models/new-vehiculo.interface';

@Component({
  selector: 'app-vehiculo-form',
  templateUrl: './vehiculo-form.component.html',
  styleUrl: './vehiculo-form.component.css'
})
export class VehiculoFormComponent {

  imagen!: string;
  combustion!: string;
  transmision!: string;
  capacidadPasajeros!: number;
  autonomia!: number;
  potencia!: number;
  estado!: string;
  numPuertas!: number;
  precioBase!: number;
  modelo!: string;

  constructor(private service: VehiculoService, private route: Router) {}

  addVehiculo() {
    this.service.createVehiculo(this.imagen, this.combustion, this.transmision, this.capacidadPasajeros,
      this.autonomia, this.potencia, this.estado, this.numPuertas, this.precioBase, this.modelo.toLowerCase())
      .subscribe((vehiculo: VehiculoAllDetails) => {
        console.log('Vehiculo añadido', vehiculo);
        this.route.navigate([`/admin/coche`]);
      });
  }

}
