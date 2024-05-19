import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ListAlquilerResponse } from '../models/list-alquileres';
import { environment } from '../environment/environment';

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

}
