import 'package:faminity/ui/widgets/app_textfield.dart';
import 'package:faminity/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingForm extends StatelessWidget {

  final String date;
  const BookingForm({super.key,required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Column(
        children:  [
          SizedBox(height: 20.h,),
          const AppTextField(labelText: 'Name',keyboardType: TextInputType.name,),
          SizedBox(height: 20.h,),
          const AppTextField(labelText: 'Phone Number',keyboardType: TextInputType.phone,),
          SizedBox(height: 20.h,),
          const AppTextField(labelText: 'Booking Type',keyboardType: TextInputType.datetime,),
          SizedBox(height: 30.h,),
          RoundedElevatedButton(onPressed: (){}, buttonText: 'Book Now', isEnabled: true),
          Text(date)
        ],
      ),
    );
  }
}