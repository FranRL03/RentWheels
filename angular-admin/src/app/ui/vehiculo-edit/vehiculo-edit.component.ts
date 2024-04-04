import { Component, OnInit, inject } from '@angular/core';
import { VehiculoService } from '../../services/vehiculo.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-vehiculo-edit',
  templateUrl: './vehiculo-edit.component.html',
  styleUrl: './vehiculo-edit.component.css'
})
export class VehiculoEditComponent implements OnInit{

  id!: string;
  imagen!: string;
  combustion: string = '';
  transmision: string = '';
  capacidadPasajeros!: number;
  autonomia!: number;
  potencia!: number;
  estado: string = '';
  numPuertas!: number;
  precioBase!: number;
  modelo!: string;

  route: ActivatedRoute = inject(ActivatedRoute);

  constructor(private service: VehiculoService, private router: Router) {
    this.id = this.route.snapshot.params['id'];
  }

  ngOnInit(): void {
      this.service.details(this.id).subscribe(resp =>{
        this.imagen = resp.imagen;
        this.combustion = resp.combustion;
        this.transmision = resp.transmision;
        this.capacidadPasajeros = resp.capacidadPasajeros;
        this.autonomia = resp.autonomia;
        this.potencia = resp.potencia;
        this.estado = resp.estado;
        this.numPuertas = resp.numPuertas;
        this.precioBase = resp.precioBase;
        this.modelo = resp.modelo.modelo;
        console.log(resp)
      });     
  }

  editVehiculo(){
    this.service.edit(this.imagen, this.combustion, this.transmision, this.capacidadPasajeros,
      this.autonomia, this.potencia, this.estado, this.numPuertas, this.precioBase, this.id).subscribe(() => {
        this.router.navigate([`/admin/coche`])
      })
  }

}
