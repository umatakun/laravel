<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

use App\User;
use App\Circles;
use App\Phones;
use App\Companies;
use App\Addresses;
use App\Images;
use App\Tags;
use App\Columns;
use App\News;
use App\QueryLogger;

class RelationsController extends Controller
{
    public function indexAction(Request $request)
    {
        return view('web.relations.index');
    }

    public function onebyoneAction(Request $request)
    {
        $users = User::with([Phones::TABLE_NAME])->get();

        $logger = QueryLogger::getInstance();
        $data = [
            'users' => $users,
            'logs' => $logger->getLogsAll(),
        ];
        return view('web.relations.onebyone', $data);
    }

    public function onebyManyAction(Request $request)
    {
        $users = User::with([Addresses::TABLE_NAME])->get();

        $logger = QueryLogger::getInstance();
        $data = [
            'users' => $users,
            'logs' => $logger->getLogsAll(),
        ];
        return view('web.relations.onebymany', $data);
    }


    public function manybyManyAction(Request $request)
    {
        $users = User::with([Circles::TABLE_NAME])->get();

        $logger = QueryLogger::getInstance();
        $data = [
            'users' => $users,
            'logs' => $logger->getLogsAll(),
        ];
        return view('web.relations.manybymany', $data);
    }

    public function hasOneThroughAction(Request $request)
    {
        $companies = Companies::with([Addresses::TABLE_NAME])->get();

        $logger = QueryLogger::getInstance();
        $data = [
            'companies' => $companies,
            'logs' => $logger->getLogsAll(),
        ];
        return view('web.relations.hasOneThrough', $data);
    }

    public function hasManyThroughAction(Request $request)
    {
        $companies = Companies::with([Addresses::TABLE_NAME])->get();

        $logger = QueryLogger::getInstance();
        $data = [
            'companies' => $companies,
            'logs' => $logger->getLogsAll(),
        ];
        return view('web.relations.hasManyThrough', $data);
    }

    public function morphOneAction(Request $request)
    {
        $users = User::with([Images::TABLE_NAME])->get();

        $logger = QueryLogger::getInstance();
        $data = [
            'users' => $users,
            'logs' => $logger->getLogsAll(),
        ];
        return view('web.relations.morphOne', $data);
    }

    public function morphManyAction(Request $request)
    {
        $users = User::with([Images::TABLE_NAME])->get();

        $logger = QueryLogger::getInstance();
        $data = [
            'users' => $users,
            'logs' => $logger->getLogsAll(),
        ];
        return view('web.relations.morphMany', $data);
    }

    public function morphedByManyAction(Request $request)
    {
        $columns = Columns::with([Tags::TABLE_NAME])->get();
        $news = News::with([Tags::TABLE_NAME])->get();
        $tags = Tags::with([Columns::TABLE_NAME, News::TABLE_NAME])->get();


        // $users = User::with([Images::TABLE_NAME])->get();

        $logger = QueryLogger::getInstance();
        $data = [
            'columns' => $columns,
            'news' => $news,
            'tags' => $tags,
            'logs' => $logger->getLogsAll(),
        ];
        return view('web.relations.morphedByMany', $data);
    }

    public function omakeAction(Request $request)
    {
        $tags = Tags::with([Columns::TABLE_NAME, News::TABLE_NAME])->get();
        $logger = QueryLogger::getInstance();
        $data = [
            'tags' => $tags,
            'logs' => $logger->getLogsAll(),
        ];
        return view('web.relations.omake', $data);
    }
}
