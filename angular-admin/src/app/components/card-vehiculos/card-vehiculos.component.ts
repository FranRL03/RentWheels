import { Component, Input, OnInit, TemplateRef } from '@angular/core';
import { Vehiculo } from '../../models/list-vehiculo.interface';
import { VehiculoService } from '../../services/vehiculo.service';
import { Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { ModeloService } from '../../services/modelo.service';
import { VehiculoAllDetails } from '../../models/new-vehiculo.interface';
import { FileService } from '../../services/file.service';

@Component({
  selector: 'app-card-vehiculos',
  templateUrl: './card-vehiculos.component.html',
  styleUrl: './card-vehiculos.component.css',
})
export class CardVehiculosComponent implements OnInit {

  vehiculoList!: Vehiculo[];
  selectedVehiculoId!: string
  vehiculoDetails!: VehiculoAllDetails;

  @Input() modeloId: string | undefined;

  totalVehiculos = 0;
  vehiculosPorPagina = 10;
  pagina = 0;
  id!: string;

  loading = false;

  constructor(private service: VehiculoService, private router: Router, private modalService: NgbModal,
    private modeloService: ModeloService, private fileService: FileService) { }

  ngOnInit(): void {
    this.loadPage();
  }

  loadPage(): void {
    if (this.modeloId) {
      this.modeloService.vehiculosModelo(this.modeloId, this.pagina - 1).subscribe(resp => {
        this.vehiculoList = resp.content;
        this.vehiculosPorPagina = resp.pageable.pageSize;
        this.totalVehiculos = resp.totalElements;
        this.vehiculoList.forEach(vehiculo => {
          this.loadImage(vehiculo);
        });
      });
    } else {
      this.service.listVehiculos(this.pagina - 1).subscribe(resp => {
        this.vehiculoList = resp.content;
        this.vehiculosPorPagina = resp.pageable.pageSize;
        this.totalVehiculos = resp.totalElements;
        this.vehiculoList.forEach(vehiculo => {
          this.loadImage(vehiculo);
        });
      });
    }
  }

  edit(id: string) {
    this.router.navigate([`admin/vehiculo/form-edit/${id}`])
    console.log(id);
  }

  details(id: string, content: TemplateRef<any>) {
    this.service.details(id).subscribe(resp => {
      this.vehiculoDetails = resp;
      this.loadModalImage(this.vehiculoDetails);
    });

    this.modalService.open(content, { backdropClass: 'light-blue-backdrop' });
  }

  delete(id: string) {
    this.loading = true;
    this.service.delete(id).subscribe(() => {
      setTimeout(() => {
        this.loading = false;
        window.location.reload();
      }, 3000);
    });
  }

  openVerticallyCentered(content: TemplateRef<any>, id: string) {
    this.selectedVehiculoId = id;
    this.modalService.open(content, { centered: true });
  }

  loadImage(vehiculo: Vehiculo): void {
    this.fileService.getFile(vehiculo.imagen).subscribe((blob: Blob) => {
      const objectUrl = URL.createObjectURL(blob);
      vehiculo.imagen = objectUrl;
    });
  }

  loadModalImage(vehiculoDetails: VehiculoAllDetails): void {
    if (vehiculoDetails && vehiculoDetails.imagen) {
      this.fileService.getFile(vehiculoDetails.imagen).subscribe((blob: Blob) => {
        const objectUrl = URL.createObjectURL(blob);
        vehiculoDetails.imagen = objectUrl;
      });
    }
  }
}

