import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-admin-section',
  templateUrl: './admin-section.component.html',
  styleUrl: './admin-section.component.css'
})
export class AdminSectionComponent implements OnInit{

  constructor(private route: Router) { }

  ngOnInit(): void {

    let token = localStorage.getItem('token');

    if (token == null) {
      this.route.navigateByUrl('/login')
    }
}

}
