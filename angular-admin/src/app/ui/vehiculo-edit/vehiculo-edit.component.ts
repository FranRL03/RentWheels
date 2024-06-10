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

}
