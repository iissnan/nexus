import { Component, OnInit } from '@angular/core';
import * as _ from 'lodash';
import * as moment from 'moment';
import { ApiService } from "../core/api.service";

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {
  matches: any;
  users: any;

  constructor(
    private apiService: ApiService
  ) { }

  ngOnInit() {
    this.getMatchesOfPage(1)
      .subscribe(response => {
        if (response.ok) {
          let res = response.json();
          this.matches = res.data;
        }
      });
    this.getUsersOfPage(1)
      .subscribe(response => {
        if (response.ok) {
          let res = response.json();
          let sorted = _.sortBy(res.data, ['rating']);
          this.users = _.slice(sorted, 0, 10);
        }
      })
  }

  getMatchesOfPage(page: number = 1) {
    return this.apiService.getMatches({
      page: page
    });
  }

  getUsersOfPage(page: number = 1) {
    return this.apiService.getUsers({
      page: page
    });
  }

  getMatchDate(date) {
    return moment(date).calendar();
  }

}
