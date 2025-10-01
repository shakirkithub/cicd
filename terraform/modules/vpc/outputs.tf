output "vpc_id" {
  value = aws_vpc.new_vpc.id
}

output "pb_subnet1" {
  value = aws_subnet.public1.id
}

output "pb_subnet2" {
  value = aws_subnet.public2.id
}

output "pvt_subnet1" {
  value = aws_subnet.private1.id
}

output "pvt_subnet2" {
  value = aws_subnet.private2.id
}
