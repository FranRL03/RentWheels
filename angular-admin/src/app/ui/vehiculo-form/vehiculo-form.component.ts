import { Component, OnInit } from '@angular/core';
import { VehiculoService } from '../../services/vehiculo.service';
import { Router } from '@angular/router';
import { ListModelosNoPage } from '../../models/list-modelos-no-page.interface';
import { ModeloService } from '../../services/modelo.service';
import { VehiculoDto } from '../../dto/vehiculo-dto';

@Component({
  selector: 'app-vehiculo-form',
  templateUrl: './vehiculo-form.component.html',
  styleUrl: './vehiculo-form.component.css'
})
export class VehiculoFormComponent implements OnInit{

  modeloList: ListModelosNoPage [] = [];

  imageSrc: string | ArrayBuffer | null | undefined = null;

  vehiculoCreate: VehiculoDto = {
    combustion:         '',
    modelo:             '',
    transmision:        '',
    capacidadPasajeros:  1,
    autonomia:          1,
    potencia:           1,
    estado:             '',
    numPuertas:         1,
    precioBase:         1,
  }

  file!: File;

  imagen!: string;

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

  loading = false

  constructor(private service: VehiculoService, private route: Router, private modeloService: ModeloService) {}

  ngOnInit(): void {
      this.modeloService.listModelosWithOutPage().subscribe(resp => {
        this.modeloList = resp;
      });
  }
  

  addVehiculo() {
    this.validacion();

    this.loading = true;  // Muestra el spinner de carga

    this.service.createVehiculo(this.vehiculoCreate, this.file)
      .subscribe(
        vehiculo => {
          console.log('Vehiculo añadido', vehiculo);
          setTimeout(() => {
            this.loading = false; 
            this.route.navigate(['/admin/coche'])
          }, 3000);
        },
      );
  }

  onFileChange(event: any) {
    const input = event.target as HTMLInputElement;
    if (input.files && input.files[0]) {
      const reader = new FileReader();
      reader.onload = (e) => {
        this.imageSrc = e.target?.result;
      };
      // agregamos la imagen seleccionada al tipo de archivo file
      reader.readAsDataURL(input.files[0]);
      this.file = input.files[0]; 
    }
  }

  validacion(){
    let errores = false;

    if(this.vehiculoCreate.transmision == '') {
      this.transmisionError = 'Por favor, selecciona una opción';
      errores = true;
    }

    if(this.vehiculoCreate.combustion == ''){
      this.combustionError = 'Por favor, selecciona una opción';
      errores = true;
    }

    if(this.vehiculoCreate.modelo == ''){
      this.modeloError = 'Por favor, selecciona una opción';
      errores = true;
    }

    if(this.vehiculoCreate.estado == ''){
      this.estadoError = 'Por favor, selecciona una opción';
      errores = true;
    }

    if(this.vehiculoCreate.capacidadPasajeros < 2 || this.vehiculoCreate.capacidadPasajeros > 10 || !this.vehiculoCreate.capacidadPasajeros){
      this.capacidadPasajerosError = 'El número de pasajeros no válido';
      errores = true;
    }

    if(this.vehiculoCreate.autonomia < 10000 || this.vehiculoCreate.autonomia > 30000 || !this.vehiculoCreate.autonomia){
      this.autonomiaError = 'Número no válido';
      errores = true;
    }

    if(this.vehiculoCreate.potencia < 90 || this.vehiculoCreate.potencia > 300 || !this.vehiculoCreate.potencia){
      this.potenciaError = 'Número no válido';
      errores = true;
    }

    if(this.vehiculoCreate.numPuertas < 2 || this.vehiculoCreate.numPuertas > 5 || !this.vehiculoCreate.numPuertas){
      this.numPuertasError = 'Número no válido';
      errores = true;
    }

    if(this.vehiculoCreate.precioBase < 1 || !this.vehiculoCreate.precioBase){
      this.precioBaseError = 'El precio no puede ser negativo';
      errores = true;
    }

    if(errores){
      return;
    }
  }

  goBack() {
    window.history.back();
  }

}
