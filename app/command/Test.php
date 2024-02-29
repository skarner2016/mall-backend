<?php

namespace app\command;

use support\Redis;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;


class Test extends Command
{
    protected static $defaultName = 'command:test';
    protected static $defaultDescription = 'Test';

    /**
     * @return void
     */
    protected function configure()
    {
        $this->addArgument('name', InputArgument::OPTIONAL, 'Name description');
    }

    /**
     * @param InputInterface $input
     * @param OutputInterface $output
     * @return int
     */
    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        // $res = Redis::set('abc', 123);
        $res = Redis::get('abc');
        
        dd(!isset($res) ? '$res === null' : $res);
        $name = $input->getArgument('name');
        $output->writeln('Hello Test');
        return self::SUCCESS;
    }

}
