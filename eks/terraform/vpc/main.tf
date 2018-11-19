resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = "Name", "${var.project}-vpc"
}

resource "aws_subnet" "main"
  count = 2

  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  cidr_block        = "10.0.${count.index}.0/24"
  vpc_id            = "${aws_vpc.main.id}"

  tags {
    Name = "${var.project}-subnet"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "${var.project}-gateway"
  }
}

resource "aws_route_table" "main" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main.id}"
  }

  tags {
    Name ="${var.project}-route-table"
  }
}

resource "aws_route_table_association" "main" {
  count = 2

  subnet_id      = "${aws_subnet.main.*.id[count.index]}"
  route_table_id = "${aws_route_table.main.id}"
}
