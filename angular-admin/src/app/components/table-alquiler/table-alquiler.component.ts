import { Component, Input, OnInit } from '@angular/core';
import { AlquilerService } from '../../services/alquiler.service';
import { Alquiler } from '../../models/list-alquileres';

interface Country {
  name: string;
  flag: string;
  area: number;
  population: number;
}

const COUNTRIES: Country[] = [
  {
    name: 'Russia',
    flag: 'f/f3/Flag_of_Russia.svg',
    area: 17075200,
    population: 146989754,
  },
  {
    name: 'Canada',
    flag: 'c/cf/Flag_of_Canada.svg',
    area: 9976140,
    population: 36624199,
  },
  {
    name: 'United States',
    flag: 'a/a4/Flag_of_the_United_States.svg',
    area: 9629091,
    population: 324459463,
  },
  {
    name: 'China',
    flag: 'f/fa/Flag_of_the_People%27s_Republic_of_China.svg',
    area: 9596960,
    population: 1409517397,
  },
];

@Component({
  selector: 'app-table-alquiler',
  templateUrl: './table-alquiler.component.html',
  styleUrl: './table-alquiler.component.css'
})
export class TableAlquilerComponent implements OnInit {
  countries = COUNTRIES;
  alquilerList!: Alquiler[];

  @Input() statusRent!: boolean;

  totalAlquileres = 0;
  alquileresPorPagina = 10;
  pagina = 0;

  constructor(private service: AlquilerService) { }

  ngOnInit(): void {
    this.loadPage();
  }

  loadPage(): void {
    if (this.statusRent == true || this.statusRent == false) {
        this.service.listaAlquileresActivosExpirados(this.pagina - 1, this.statusRent).subscribe(resp => {
          this.alquilerList = resp.content;
          this.alquileresPorPagina = resp.pageable.pageSize;
          this.totalAlquileres = resp.totalElements;
        });
    } else {
      this.service.listaTodosAlquileres(this.pagina - 1).subscribe(resp => {
        this.alquilerList = resp.content;
        this.alquileresPorPagina = resp.pageable.pageSize;
        this.totalAlquileres = resp.totalElements;
      });
    }
  }

}
