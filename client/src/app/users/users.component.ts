import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ApiService } from "../core/api.service";

@Component({
  selector: 'app-users',
  templateUrl: './users.component.html',
  styleUrls: ['./users.component.scss']
})
export class UsersComponent implements OnInit {
  users: any;
  page: number;
  pagination: any = {
    items: []
  };

  constructor(
    private apiService: ApiService,
    private router: Router
  ) { }

  ngOnInit() {
    this.goPage(1);
  }

  goPage(page: number = 1) {
    this.apiService.getUsers({
      page: page
    }).subscribe(response => {
      if (response.ok) {
        let res = response.json();
        let paginationItems = new Array(res.meta.total_pages);

        this.users = res.data;
        this.pagination = {
          total_count: res.meta.total_count,
          items: []
        };

        for (let i = 0; i < paginationItems.length; i++) {
          let page = i + 1;
          this.pagination.items[i] = {
            page: page,
            current: page === res.meta.current_page
          };
        }

        this.router.navigate([], {
          queryParams: { page: page }
        });
      }
    });
  }
}
