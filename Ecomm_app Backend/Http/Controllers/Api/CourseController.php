<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Course;

class CourseController extends Controller
{
    //Here we are returning all the course list
    public function courseList(){

        //Select methods select the fields without returning them. 
        try{
            $result = Course::select('name', 'thumbnail', 'lesson_num', 'price', 'id')->get();    //The get method returns them.

        
        return response()->json([
            'code' => 200,
            'msg' => 'My course list is here',
            'data' => $result   //This is also Json data.
        ], 200);
        }catch(\Throwable $throw){
            return response()->json([
                'code'=>500,
                'msg'=> 'The column does not exist or you have a syntax error',
                'data'=> $throw->getMessage()
            ],500);
        }
    }

    //Returning a course detail.
    public function courseDetail(Request $request){
        //Course id
        $id = $request->id;
        //Select methods select the fields without returning them. 
        try{
            $result = Course::where('id', '=', $id)->select(
                'id',
                'name', 
                'user_token',
                'description',
                'price',
                'lesson_num',
                'video_length',
                'thumbnail',  
                'price', 
                'downloadable_resources'
                
                )
                    ->first();    //The get method returns a collection of items, first method returns one item, the first item found or recieved.

        
        return response()->json([
            'code' => 200,
            'msg' => 'My course detail is here',
            'data' => $result   //This is also Json data.
        ], 200);
        }catch(\Throwable $throw){
            return response()->json([
                'code'=>500,
                'msg'=> 'The column does not exist or you have a syntax error',
                'data'=> $throw->getMessage()
            ],500);
        }
    }
}
