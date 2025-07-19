output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = aws_subnet.public.*.id
}

output "private_subnet_ids" {
  value = aws_subnet.private.*.id
}

output "public_cidrs" {
  value = aws_subnet.public.*.cidr_block
}

output "private_cidrs" {
  value = aws_subnet.private.*.cidr_block
}

output "public_azs" {
  value = aws_subnet.public.*.availability_zone
}

output "private_azs" {
  value = aws_subnet.private.*.availability_zone
}

output "public_az_ids" {
  value = aws_subnet.public.*.availability_zone_id
}

output "private_az_ids" {
  value = aws_subnet.private.*.availability_zone_id
}

