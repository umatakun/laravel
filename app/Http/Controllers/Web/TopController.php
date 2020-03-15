<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class TopController extends Controller
{
    public function indexAction(Request $request)
    {
        return view('web.index');
    }

    public function uploadAction(Request $request)
    {
        $data = [
            'status' => 200,
            'message' => 'OK',
            'fileName' => null
        ];
        try{
            $image = $request->file('image');
            $filaName = $image->store('public/temp');
        } catch (\Exception $e) {
            $data = [
                'status' => 500,
                'message' => $e->getMessage(),
            ];
            return response()->json($data);
        }
        $data['fileName'] = str_replace('storage/temp/', '', $filaName);
        return response()->json($data);
    }

    public function getImageAction(Request $request)
    {
        $data = [
            'status' => 200,
            'message' => 'OK',
            'fileName' => null
        ];
        $fileName = $request->get('file_name');
        if (empty($fileName)) {
            $data = [
                'status' => 401,
                'message' => 'invalid name',
            ];
            return response()->json($data);
        }
        
        // 一時領域から先に取りに行く。
        try{
            Storage::get('public/temp/'.$fileName);
            $data['fileName'] = 'storage/temp/' . $fileName;
        } catch (\Exception $e) {
            $data['fileName'] = 'storage/published/default.png';
        } 

        // 公開領域から先に取りに行く。
        try{
            Storage::get('public/published/'.$fileName);
            $data['fileName'] = 'storage/published/' . $fileName;
        } catch (\Exception $e) {
            $data['fileName'] = 'storage/published/default.png';
        } 

        return response()->json($data);
    }

    public function publishAction(Request $request)
    {
        $data = [
            'status' => 200,
            'message' => 'OK',
        ];
        $fileName = $request->get('file_name');
        if (empty($fileName)) {
            $data = [
                'status' => 401,
                'message' => 'invalid name',
            ];
            return response()->json($data);
        }
        try{
            Storage::move('public/temp/' . $fileName, 'public/published/' . $fileName);
        } catch (\Exception $e) {
            $data = [
                'status' => 500,
                'message' => $e->getMessage(),
            ];
        }
        return response()->json($data);
    }

    public function deleteAction(Request $request)
    {
        $data = [
            'status' => 200,
            'message' => 'OK',
        ];
        $fileName = $request->get('file_name');
        // 公開領域から先に取りに行く。
        try{
            Storage::get('public/published/'.$fileName);
        } catch (\Exception $e) {
            $data = [
                'status' => 404,
                'message' => 'Not Found',
            ];
            return response()->json($data);
        } 
        try{
            Storage::move('public/published/' . $fileName, 'deleted/' . $fileName);
        } catch (\Exception $e) {
            $data = [
                'status' => 500,
                'message' => $e->getMessage(),
            ];
        }
        return response()->json($data);
    }

    public function recoverAction(Request $request)
    {
        $data = [
            'status' => 200,
            'message' => 'OK',
        ];
        $fileName = $request->get('file_name');
        // 公開領域から先に取りに行く。
        try{
            Storage::get('deleted/'.$fileName);
        } catch (\Exception $e) {
            $data = [
                'status' => 404,
                'message' => 'Not Found',
            ];
            return response()->json($data);
        } 
        try{
            Storage::move('deleted/' . $fileName, 'public/published/' . $fileName);
        } catch (\Exception $e) {
            $data = [
                'status' => 500,
                'message' => $e->getMessage(),
            ];
        }
        return response()->json($data);
    }

}
