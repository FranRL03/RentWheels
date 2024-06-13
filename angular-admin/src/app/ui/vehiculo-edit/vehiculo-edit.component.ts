import { Component, OnInit, inject } from '@angular/core';
import { VehiculoService } from '../../services/vehiculo.service';
import { ActivatedRoute, Router } from '@angular/router';
import { VehiculoDto } from '../../dto/vehiculo-dto';
import { FileService } from '../../services/file.service';

@Component({
  selector: 'app-vehiculo-edit',
  templateUrl: './vehiculo-edit.component.html',
  styleUrl: './vehiculo-edit.component.css'
})
export class VehiculoEditComponent implements OnInit {

  id!: string;
  imagen!: string;
  imagenSelected: string | ArrayBuffer | null | undefined = null;


  vehiculoEditado: VehiculoDto = {
    combustion: '',
    modelo: '',
    transmision: '',
    capacidadPasajeros: 1,
    autonomia: 1,
    potencia: 1,
    estado: '',
    numPuertas: 1,
    precioBase: 1,
  }

  file!: File;
  loading = false
  showErrorEdit = false;

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

  route: ActivatedRoute = inject(ActivatedRoute);

  constructor(private service: VehiculoService, private router: Router, private fileService: FileService) {
    this.id = this.route.snapshot.params['id'];
  }

  ngOnInit(): void {
    this.service.details(this.id).subscribe(resp => {
      this.imagen = resp.imagen;
      this.vehiculoEditado.combustion = resp.combustion;
      this.vehiculoEditado.transmision = resp.transmision;
      this.vehiculoEditado.capacidadPasajeros = resp.capacidadPasajeros;
      this.vehiculoEditado.autonomia = resp.autonomia;
      this.vehiculoEditado.potencia = resp.potencia;
      this.vehiculoEditado.estado = resp.estado;
      this.vehiculoEditado.numPuertas = resp.numPuertas;
      this.vehiculoEditado.precioBase = resp.precioBase;
      this.vehiculoEditado.modelo = resp.modelo.modelo;
      this.loadImage(this.imagen);
      console.log(resp)
    });
  }

  onFileChange(event: any) {
    const input = event.target as HTMLInputElement;
    if (input.files && input.files[0]) {
      const reader = new FileReader();
      reader.onload = (e) => {
        this.imagenSelected = e.target?.result;
      };
      // agregamos la imagen seleccionada al tipo de archivo file
      reader.readAsDataURL(input.files[0]);
      this.file = input.files[0];
    }
  }

  editVehiculo() {
    this.validacion();
    this.loading = true;
    this.service.edit(this.vehiculoEditado, this.file, this.id).subscribe(edit => {
      console.log('Vehiculo editado', edit)
      setTimeout(() => {
        this.loading = false;
        this.router.navigate([`/admin/coche`])
      }, 2000);
    },
  error => {
    this.loading = false;
    this.showErrorEdit = true;
  });
  }

  loadImage(filename: string): void {
    this.fileService.getFile(filename).subscribe((blob: Blob) => {
      const objectUrl = URL.createObjectURL(blob);
      this.imagen = objectUrl;
    });
  }

  goBack() {
    window.history.back();
  }

  removeImgSelected() {
    this.imagenSelected = null;
    const input = document.getElementById('file-upload-input') as HTMLInputElement;
    if (input) {
      input.value = '';
    }
  }

  validacion() {
    let errores = false;

    if(!this.imagenSelected) {
      this.imagenError = 'La imagen no puede estar vacía';
      errores = true;
    }
    
    if (this.vehiculoEditado.transmision == '') {
      this.transmisionError = 'Por favor, selecciona una opción';
      errores = true;
    }

    if (this.vehiculoEditado.combustion == '') {
      this.combustionError = 'Por favor, selecciona una opción';
      errores = true;
    }

    if (this.vehiculoEditado.modelo == '') {
      this.modeloError = 'Por favor, selecciona una opción';
      errores = true;
    }

    if (this.vehiculoEditado.estado == '') {
      this.estadoError = 'Por favor, selecciona una opción';
      errores = true;
    }

    if (this.vehiculoEditado.capacidadPasajeros < 2 || this.vehiculoEditado.capacidadPasajeros > 10 || !this.vehiculoEditado.capacidadPasajeros) {
      this.capacidadPasajerosError = 'El número de pasajeros no válido';
      errores = true;
    }

    if (this.vehiculoEditado.autonomia < 10000 || this.vehiculoEditado.autonomia > 30000 || !this.vehiculoEditado.autonomia) {
      this.autonomiaError = 'Número no válido';
      errores = true;
    }

    if (this.vehiculoEditado.potencia < 90 || this.vehiculoEditado.potencia > 300 || !this.vehiculoEditado.potencia) {
      this.potenciaError = 'Número no válido';
      errores = true;
    }

    if (this.vehiculoEditado.numPuertas < 2 || this.vehiculoEditado.numPuertas > 5 || !this.vehiculoEditado.numPuertas) {
      this.numPuertasError = 'Número no válido';
      errores = true;
    }

    if (this.vehiculoEditado.precioBase < 80 || !this.vehiculoEditado.precioBase) {
      this.precioBaseError = 'El precio no puede ser menor a 80';
      errores = true;
    }

    if (errores) {
      return;
    }
  }

}
