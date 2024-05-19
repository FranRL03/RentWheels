import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ListAlquilerResponse } from '../models/list-alquileres';
import { environment } from '../environment/environment';
import { AlquilerDetails } from '../models/detalles-alquiler';

@Injectable({
  providedIn: 'root'
})
export class AlquilerService {

  constructor(private http: HttpClient) { }

  listaTodosAlquileres(page:number): Observable<ListAlquilerResponse> {
    return this.http.get<ListAlquilerResponse>(`${environment.apiBaseUrl}/admin/alquiler?page=${page}`,
      {
        headers: {
          'Authorization': `Bearer ${localStorage.getItem('token')}`
        }
      }
    )
  }

  listaAlquileresActivosExpirados(page:number, statusRent:boolean): Observable<ListAlquilerResponse> {
    return this.http.get<ListAlquilerResponse>(`${environment.apiBaseUrl}/admin/alquiler/${statusRent}?page=${page}`,
      {
        headers: {
          'Authorization': `Bearer ${localStorage.getItem('token')}`
        }
      }
    )
  }

  details(id: string): Observable<AlquilerDetails> {
    return this.http.get<AlquilerDetails>(`${environment.apiBaseUrl}/admin/alquiler-details/${id}`, 
    {
      headers: {
        'Authorization': `Bearer ${localStorage.getItem('token')}`
      }
    }
    )
  }

}
