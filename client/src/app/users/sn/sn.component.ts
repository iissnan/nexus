import { Component, OnInit, OnDestroy } from '@angular/core';
import { ApiService } from "../../core/api.service";
import { ActivatedRoute } from "@angular/router";

interface BindResult {
  success: boolean,
  message: string
}

@Component({
  selector: 'app-sn',
  templateUrl: './sn.component.html',
  styleUrls: ['./sn.component.scss']
})
export class SnComponent implements OnInit, OnDestroy {
  private paramSubscribe: any;
  private bound: boolean = false;
  private username: string;
  number: number;
  result: BindResult = {
    success: false,
    message: ''
  };

  constructor(
    private route: ActivatedRoute,
    private apiService: ApiService
  ) { }

  ngOnInit() {
    this.paramSubscribe = this.route.params
      .subscribe(params => {
        this.username = params['username'];
      });
  }

  ngOnDestroy() {
    this.paramSubscribe.unsubscribe();
  }

  bindNumber() {
    this.apiService
      .bindNumber({
        params: {
          username: this.username,
          number: this.number
        }
      })
      .subscribe(response => {
        this.bound = true;
        if (response.ok) {
          let data = response.json();
          this.result ={
            success: true,
            message: `Your account has bound with the number: ${data.number}`
          };
        } else {
          this.result = {
            success: false,
            message: `Binding number ${this.number} failed`
          };
        }
      });
  }

}
