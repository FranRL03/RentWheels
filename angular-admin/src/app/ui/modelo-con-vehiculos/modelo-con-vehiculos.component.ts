import { Component, OnInit, TemplateRef, inject } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { ModeloService } from '../../services/modelo.service';
import { ModeloDto } from '../../dto/modelo-dto';
import { FileService } from '../../services/file.service';

@Component({
  selector: 'app-modelo-con-vehiculos',
  templateUrl: './modelo-con-vehiculos.component.html',
  styleUrl: './modelo-con-vehiculos.component.css'
})
export class ModeloConVehiculosComponent implements OnInit {

  route: ActivatedRoute = inject(ActivatedRoute);
  idModelo!: string;

  logo!: string;
  logoSelected: string | ArrayBuffer | null | undefined = null;


  modeloEditado: ModeloDto = {
    modelo: ''
  }

  file!: File;

  logoError: string = '';
  modeloError: string = '';

  totalVehiculos = 0;
  vehiculosPorPagina = 10;
  pagina = 0;

  show = false;
  loading = false;

  constructor(private modalService: NgbModal, private router: Router, 
    private modeloService: ModeloService, private fileService: FileService) {
    this.idModelo = this.route.snapshot.params['idModelo'];
  }

  ngOnInit(): void {
    this.modeloService.modeloDetails(this.idModelo).subscribe(resp => {
      this.modeloEditado.modelo = resp.modelo;
      this.logo = resp.logo;
      this.loadImage(this.logo);
    });

    this.comprobacionCantVehiculos();
  }

  openBackDropCustomClass(content: TemplateRef<any>) {
    this.modalService.open(content, { backdropClass: 'light-blue-backdrop' });
  }

  onFileChange(event: any) {
    const input = event.target as HTMLInputElement;
    if (input.files && input.files[0]) {
      const reader = new FileReader();
      reader.onload = (e) => {
        this.logoSelected = e.target?.result;
      };
      // agregamos la imagen seleccionada al tipo de archivo file
      reader.readAsDataURL(input.files[0]);
      this.file = input.files[0]; 
    }
  }

  editar() {
    this.loading = true;
    this.modeloService.editModelo(this.modeloEditado, this.file, this.idModelo).subscribe(response => {
      console.log('Profile updated successfully', response);
      setTimeout(() => {
        this.loading = false;
        this.router.navigate([`/admin/modelos`]);
      }, 3000);
    });
  }

  goBack() {
    window.history.back();
  }

  clear(idModelo: string) {
    this.loading = true;
    this.modeloService.clear(idModelo).subscribe(() => {
      setTimeout(() => {
        this.loading = false;
        window.location.reload();
        this.router.navigateByUrl(`/admin/modelo/${idModelo}`).then(() => {
          if (this.totalVehiculos >= 1) {
            this.show = true;
          }
          this.modalService.dismissAll()
        });
      }, 3000);
    });
  }

  comprobacionCantVehiculos() {
    this.modeloService.vehiculosModelo(this.idModelo, this.pagina - 1).subscribe(resp => {
      this.totalVehiculos = resp.totalElements;
    },
    );
  }

  delete(idModelo: string) {
    this.loading = true;
    this.modeloService.delete(idModelo).subscribe(() => {
      setTimeout(() => {
        this.loading = false;
        window.location.href = `http://localhost:4200/admin/modelos`;
      }, 3000);
    });
  }

  loadImage(filename: string): void {
    this.fileService.getFile(filename).subscribe((blob: Blob) => {
      const objectUrl = URL.createObjectURL(blob);
      this.logo = objectUrl;
    });
  }

}
