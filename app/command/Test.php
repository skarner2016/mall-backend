<?php

namespace app\command;

use Exception;
use support\Redis;
use app\library\Email;
use PHPMailer\PHPMailer\PHPMailer;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

// use Symfony\Component\Mailer\Transport;
// use Symfony\Component\Mailer\Mailer;
// use Symfony\Component\Mime\Email;


class Test extends Command
{
    protected static $defaultName        = 'command:test';
    protected static $defaultDescription = 'Test';
    
    /**
     * @return void
     */
    protected function configure()
    {
        $this->addArgument('name', InputArgument::OPTIONAL, 'Name description');
    }
    
    /**
     * @param InputInterface  $input
     * @param OutputInterface $output
     * @return int
     */
    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        
        $res = Redis::get('abc');
        
        dd(!isset($res) ? '$res === null' : $res);
        $name = $input->getArgument('name');
        $output->writeln('Hello Test');
        
        return self::SUCCESS;
    }
    
}
