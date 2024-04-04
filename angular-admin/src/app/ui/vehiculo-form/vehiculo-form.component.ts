import { Component, OnInit } from '@angular/core';
import { VehiculoService } from '../../services/vehiculo.service';
import { Router } from '@angular/router';
import { VehiculoAllDetails } from '../../models/new-vehiculo.interface';
import { ListModelosNoPage } from '../../models/list-modelos-no-page.interface';
import { ModeloService } from '../../services/modelo.service';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-vehiculo-form',
  templateUrl: './vehiculo-form.component.html',
  styleUrl: './vehiculo-form.component.css'
})
export class VehiculoFormComponent implements OnInit{

  modeloList: ListModelosNoPage [] = [];

  imagen!: string;
  combustion: string = '';
  transmision: string = '';
  capacidadPasajeros!: number;
  autonomia!: number;
  potencia!: number;
  estado: string = '';
  numPuertas!: number;
  precioBase!: number;
  modelo: string = '';

  imagenError: string = '';
  combustionError: string = '';
  transmisionError: string = '';
  capacidadPasajerosError: string = '';
  autonomiaError: string = '';
  potenciaError: string = '';
  estadoError: string = '';
  numPuertasError: string = '';
  precioBaseError: string = '';
  modeloError: string = '';

  constructor(private service: VehiculoService, private route: Router, private modeloService: ModeloService) {}

  ngOnInit(): void {
      this.modeloService.listModelosWithOutPage().subscribe(resp => {
        this.modeloList = resp;
      });
  }
  
  addVehiculo() {

    this.validacion();

    this.service.createVehiculo(this.imagen, this.combustion, this.transmision, this.capacidadPasajeros,
      this.autonomia, this.potencia, this.estado, this.numPuertas, this.precioBase, this.modelo.toLowerCase())
      .subscribe((vehiculo: VehiculoAllDetails) => {
        console.log('Vehiculo añadido', vehiculo);
        this.route.navigate([`/admin/coche`]);
      });
  }

  validacion(){
    let errores = false;

    if(this.transmision == '') {
      this.transmisionError = 'Por favor, selecciona una opción';
      errores = true;
    }

    if(this.combustion == ''){
      this.combustionError = 'Por favor, selecciona una opción';
      errores = true;
    }

    if(this.modelo == ''){
      this.modeloError = 'Por favor, selecciona una opción';
      errores = true;
    }

    if(this.estado == ''){
      this.estadoError = 'Por favor, selecciona una opción';
      errores = true;
    }

    if(this.capacidadPasajeros < 2 || this.capacidadPasajeros > 10 || !this.capacidadPasajeros){
      this.capacidadPasajerosError = 'El número de pasajeros no válido';
      errores = true;
    }

    if(this.autonomia < 10000 || this.autonomia > 30000 || !this.autonomia){
      this.autonomiaError = 'Número no válido';
      errores = true;
    }

    if(this.potencia < 90 || this.potencia > 300 || !this.potencia){
      this.potenciaError = 'Número no válido';
      errores = true;
    }

    if(this.numPuertas < 2 || this.numPuertas > 5 || !this.numPuertas){
      this.numPuertasError = 'Número no válido';
      errores = true;
    }

    if(this.precioBase < 1 || !this.precioBase){
      this.precioBaseError = 'El precio no puede ser negativo';
      errores = true;
    }

    if(errores){
      return;
    }
  }


}
