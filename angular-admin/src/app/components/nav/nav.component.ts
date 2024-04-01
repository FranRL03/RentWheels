import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { LoginResponse } from '../../models/login.interface';
import { UserDetailsResponse } from '../../models/user-details';
import { UserService } from '../../services/user.service';

@Component({
  selector: 'app-nav',
  templateUrl: './nav.component.html',
  styleUrl: './nav.component.css'
})
export class NavComponent implements OnInit{

  admin!: UserDetailsResponse;
  token!: string;

  constructor(private route: Router, private userService: UserService) { }

  ngOnInit(): void {
      this.token = localStorage.getItem('token') as string;
      if(this.token !== null) {
        this.userService.getUserDetails().subscribe(resp =>{
          this.admin = resp;
        });
      }
  }

}
