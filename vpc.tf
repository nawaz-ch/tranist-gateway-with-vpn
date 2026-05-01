resource "aws_vpc" "on-prem" {
  cidr_block = var.vpc_cidr
}


resource "aws_vpc" "vpc_2" {
  cidr_block = var.vpc_cidr_2
}


resource "aws_vpc" "vpc_3" {
  cidr_block = var.vpc_cidr_3
}