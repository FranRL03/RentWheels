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

  modeloEditado: ModeloDto = {
    modelo: ''
  }

  file!: File;

  logoError: string = '';
  modeloError: string = '';

  totalVehiculos = 0;
  vehiculosPorPagina = 10;
  pagina = 0;

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
    this.file = event.target.files[0];
  }

  editar() {
    this.modeloService.editModelo(this.modeloEditado, this.file, this.idModelo).subscribe(response => {
      console.log('Profile updated successfully', response);
      this.router.navigate([`/admin/modelos`]);
    }, error => {
      console.error('Error updating profile', error);
    });
  }

  goBack() {
    window.history.back();
  }

  clear(idModelo: string) {
    this.modeloService.clear(idModelo).subscribe();
        window.location.href = `http://localhost:4200/admin/modelo/${idModelo}`;
  }

  comprobacionCantVehiculos() {
    this.modeloService.vehiculosModelo(this.idModelo, this.pagina - 1).subscribe(resp => {
      this.totalVehiculos = resp.totalElements;
    },
    );
  }

  delete(idModelo: string) {
    this.modeloService.delete(idModelo).subscribe();
    window.location.href = `http://localhost:4200/admin/modelos`;
  }

  loadImage(filename: string): void {
    this.fileService.getFile(filename).subscribe((blob: Blob) => {
      const objectUrl = URL.createObjectURL(blob);
      this.logo = objectUrl;
    });
  }

}
