import { Component, OnInit } from '@angular/core';
import { SpinnerService } from "./spinner.service";

@Component({
  selector: 'app-spinner',
  templateUrl: './spinner.component.html',
  styleUrls: ['./spinner.component.scss']
})
export class SpinnerComponent implements OnInit {
  shouldDisplay: boolean = false;

  constructor(private spinnerService: SpinnerService) { }

  ngOnInit() {
    this.spinnerService.active.subscribe((active: boolean) => {
      this.shouldDisplay = active;
    });
  }

}
